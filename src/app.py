import os
from flask import Flask, request, jsonify, url_for
from flask_migrate import Migrate
from flask_swagger import swagger
from flask_cors import CORS
from utils import APIException, generate_sitemap
from admin import setup_admin
from models import db, User, Favorite, Planet, Character

app = Flask(__name__)
app.url_map.strict_slashes = False

db_url = os.getenv("DATABASE_URL")
if db_url is not None:
    app.config['SQLALCHEMY_DATABASE_URI'] = db_url.replace("postgres://", "postgresql://")
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:////tmp/test.db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

MIGRATE = Migrate(app, db)
db.init_app(app)
CORS(app)
setup_admin(app)

@app.errorhandler(APIException)
def handle_invalid_usage(error):
    return jsonify(error.to_dict()), error.status_code

@app.route('/')
def sitemap():
    return generate_sitemap(app)

@app.route('/user', methods=['GET'])
def get_users():
    users = User.query.all()
    return jsonify([user.serialize() for user in users]), 200

@app.route('/user', methods=['POST'])
def create_user():
    data = request.get_json()
    user = User(email=data['email'], password=data['password'])
    db.session.add(user)
    db.session.commit()
    return jsonify(user.serialize()), 201

@app.route('/favorite', methods=['GET'])
def get_favorites():
    favorites = Favorite.query.all()
    return jsonify([favorite.serialize() for favorite in favorites]), 200

@app.route('/favorite', methods=['POST'])
def create_favorite():
    data = request.get_json()
    favorite = Favorite(user_id=data['user_id'], planet_id=data['planet_id'], character_id=data['character_id'])
    db.session.add(favorite)
    db.session.commit()
    return jsonify(favorite.serialize()), 201

@app.route('/planet', methods=['GET'])
def get_planets():
    planets = Planet.query.all()
    return jsonify([planet.serialize() for planet in planets]), 200

@app.route('/planet', methods=['POST'])
def create_planet():
    data = request.get_json()
    planet = Planet(name=data['name'], description=data['description'])
    db.session.add(planet)
    db.session.commit()
    return jsonify(planet.serialize()), 201

@app.route('/character', methods=['GET'])
def get_characters():
    characters = Character.query.all()
    return jsonify([character.serialize() for character in characters]), 200

@app.route('/character', methods=['POST'])
def create_character():
    data = request.get_json()
    character = Character(name=data['name'], description=data['description'])
    db.session.add(character)
    db.session.commit()
    return jsonify(character.serialize()), 201

if __name__ == '__main__':
    PORT = int(os.environ.get('PORT', 3000))
    app.run(host='0.0.0.0', port=PORT, debug=False)
