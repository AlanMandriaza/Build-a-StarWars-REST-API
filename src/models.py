from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import ForeignKey, Column, Integer, String, DateTime

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(250), nullable=False)
    password = db.Column(db.String(250), nullable=False)
    first_name = db.Column(db.String(250), nullable=True)
    last_name = db.Column(db.String(250), nullable=True)
    subscription_date = db.Column(db.DateTime, nullable=True)
    favorites = db.relationship("Favorite", back_populates="user")

    def __repr__(self):
        return '<User %r>' % self.email

    def serialize(self):
        return {
            "id": self.id,
            "email": self.email,
            # do not serialize the password, it's a security breach
        }

class Favorite(db.Model):
    __tablename__ = 'favorite'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    user = db.relationship("User", back_populates="favorites")
    planet_id = db.Column(db.Integer, db.ForeignKey('planet.id'))
    planet = db.relationship("Planet", back_populates="favorites")
    character_id = db.Column(db.Integer, db.ForeignKey('character.id'))
    character = db.relationship("Character", back_populates="favorites")

    def __repr__(self):
        return '<Favorite %r>' % self.id

    def serialize(self):
        return {
            "id": self.id,
            "user_id": self.user_id,
            "planet_id": self.planet_id,
            "character_id": self.character_id
        }

class Planet(db.Model):
    __tablename__ = 'planet'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(250), nullable=False)
    description = db.Column(db.String(1000), nullable=True)
    favorites = db.relationship("Favorite", back_populates="planet")

    def __repr__(self):
        return '<Planet %r>' % self.name

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "description": self.description
        }

class Character(db.Model):
    __tablename__ = 'character'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(250), nullable=False)
    description = db.Column(db.String(1000), nullable=True)
    favorites = db.relationship("Favorite", back_populates="character")

    def __repr__(self):
        return '<Character %r>' % self.name

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "description": self.description
        }
