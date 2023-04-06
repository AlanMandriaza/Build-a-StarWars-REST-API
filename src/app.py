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

# Handle/serialize errors like a JSON object
@app.errorhandler(APIException)
def handle_invalid_usage(error):
    return jsonify(error.to_dict()), error.status_code

# generate sitemap with all your endpoints
@app.route('/')
def sitemap():
    return generate_sitemap(app)

@app.route('/users', methods=['GET'])
def get_users():
    users = User.query.all()
    users = list(map(lambda user: user.serialize(), users))
    return jsonify(users), 200

@app.route('/users', methods=['POST'])
def create_user():
    body = request.get_json()

    if 'email' not in body or 'password' not in body:
        return jsonify({"msg": "Missing required fields"}), 400

    new_user = User(email=body['email'], password=body['password'])

    if 'first_name' in body:
        new_user.first_name = body['first_name']
    if 'last_name' in body:
        new_user.last_name = body['last_name']

    db.session.add(new_user)
    db.session.commit()

    return jsonify(new_user.serialize()), 201


@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    user = User.query.get(user_id)

    if user is None:
        return jsonify({"msg": "User not found"}), 404

    return jsonify(user.serialize()), 200

@app.route('/user/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    user = User.query.get(user_id)

    if user is None:
        return jsonify({"msg": "User not found"}), 404

    db.session.delete(user)
    db.session.commit()

    return jsonify({"msg": "User deleted"}), 200

    # Endpoint to create a new favorite for a user
@app.route('/favorite', methods=['POST'])
def create_favorite():
    body = request.get_json()

    if 'user_id' not in body:
        return jsonify({"msg": "Missing user_id field"}), 400

    new_favorite = Favorite(user_id=body['user_id'])

    if 'planet_id' in body:
        new_favorite.planet_id = body['planet_id']
    if 'character_id' in body:
        new_favorite.character_id = body['character_id']

    db.session.add(new_favorite)
    db.session.commit()
    return jsonify(new_favorite.serialize()), 201

# Endpoint to get all favorites for a user
# Endpoint to get all user favorites
@app.route('/users/favorites', methods=['GET'])
def get_all_user_favorites():
    favorites = Favorite.query.all()
    favorites = list(map(lambda favorite: favorite.serialize(), favorites))

    return jsonify(favorites), 200



# Endpoint to create a new favorite planet for the current user
@app.route('/favorite/planet', methods=['POST'])
def add_favorite_planet():
    body = request.get_json()

    if 'user_id' not in body or 'planet_id' not in body:
        return jsonify({"msg": "Missing user_id or planet_id field"}), 400

    user_id = body['user_id']
    planet_id = body['planet_id']

    user = User.query.get(user_id)
    planet = Planet.query.get(planet_id)

    if user is None:
        return jsonify({"msg": "User not found"}), 404

    if planet is None:
        return jsonify({"msg": "Planet not found"}), 404

    new_favorite = Favorite(user=user, planet=planet)

    db.session.add(new_favorite)
    db.session.commit()

    return jsonify(new_favorite.serialize()), 201


# Endpoint to get all favorites for a character
@app.route('/favorite/character/<int:character_id>', methods=['GET'])
def get_favorites_for_character(character_id):
    character = Character.query.get(character_id)

    if character is None:
        return jsonify({"msg": "Character not found"}), 404

    favorites = character.favorites
    favorites = list(map(lambda favorite: favorite.serialize(), favorites))

    return jsonify(favorites), 200

# Endpoint to delete a favorite by ID
@app.route('/favorite/<int:favorite_id>', methods=['DELETE'])
def delete_favorite(favorite_id):
    favorite = Favorite.query.get(favorite_id)

    if favorite is None:
        return jsonify({"msg": "Favorite not found"}), 404

    db.session.delete(favorite)
    db.session.commit()

    return jsonify({"msg": "Favorite deleted"}), 200

# Endpoint para crear un nuevo planeta
@app.route('/planet', methods=['POST'])
def create_planet():
    body = request.get_json()

    if 'name' not in body:
        return jsonify({"msg": "Falta el campo name"}), 400

    new_planet = Planet(name=body['name'])

    if 'description' in body:
        new_planet.description = body['description']

    db.session.add(new_planet)
    db.session.commit()

    return jsonify(new_planet.serialize()), 201

# Endpoint para obtener todos los planetas
@app.route('/planet', methods=['GET'])
def get_planets():
    planets = Planet.query.all()
    planets = list(map(lambda planet: planet.serialize(), planets))

    return jsonify(planets), 200

# Endpoint para obtener un planeta por ID
@app.route('/planet/<int:planet_id>', methods=['GET'])
def get_planet_by_id(planet_id):
    planet = Planet.query.get(planet_id)

    if planet is None:
        return jsonify({"msg": "Planeta no encontrado"}), 404

    return jsonify(planet.serialize()), 200

# Endpoint para actualizar un planeta por ID
@app.route('/planet/<int:planet_id>', methods=['PUT'])
def update_planet(planet_id):
    body = request.get_json()
    planet = Planet.query.get(planet_id)

    if planet is None:
        return jsonify({"msg": "Planeta no encontrado"}), 404

    if 'name' in body:
        planet.name = body['name']
    if 'description' in body:
        planet.description = body['description']

    db.session.commit()

    return jsonify(planet.serialize()), 200

# Endpoint para borrar un planeta por ID
@app.route('/planet/<int:planet_id>', methods=['DELETE'])
def delete_planet(planet_id):
    planet = Planet.query.get(planet_id)

    if planet is None:
        return jsonify({"msg": "Planeta no encontrado"}), 404

    db.session.delete(planet)
    db.session.commit()

    return jsonify({"msg": "Planeta eliminado"}), 200


# Endpoint para crear un nuevo personaje favorito
@app.route('/favorite/people', methods=['POST'])
def create_favorite_character():
    body = request.get_json()

    if 'user_id' not in body or 'character_id' not in body:
        return jsonify({"msg": "Missing required fields"}), 400

    user = User.query.get(body['user_id'])
    character = Character.query.get(body['character_id'])

    if user is None:
        return jsonify({"msg": "User not found"}), 404

    if character is None:
        return jsonify({"msg": "Character not found"}), 404

    new_favorite = Favorite(user=user, character=character)

    db.session.add(new_favorite)
    db.session.commit()

    return jsonify(new_favorite.serialize()), 201

# Endpoint para crear un nuevo personaje
@app.route('/people', methods=['POST'])
def create_character():
    body = request.get_json()

    if 'name' not in body:
        return jsonify({"msg": "Falta el campo name"}), 400

    new_character = Character(name=body['name'])

    if 'description' in body:
        new_character.description = body['description']

    db.session.add(new_character)
    db.session.commit()

    return jsonify(new_character.serialize()), 201

# Endpoint para obtener todos los personajes
@app.route('/people', methods=['GET'])
def get_characters():
    characters = Character.query.all()
    characters = list(map(lambda character: character.serialize(), characters))

    return jsonify(characters), 200


# this only runs if `$ python src/app.py` is executed
if __name__ == '__main__':
    PORT = int(os.environ.get('PORT', 3000))
    app.run(host='0.0.0.0', port=PORT, debug=False)
