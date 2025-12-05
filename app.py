from flask import Flask, jsonify
from flask_cors import CORS
from pymongo import MongoClient

app = Flask(__name__)
CORS(app)

# ---------------- MONGO CONNECTION ----------------
client = MongoClient("mongodb://localhost:27017/")
db = client["db_maison_des_saveurs"]

# ---------------- HELPER ----------------


def serialize_doc(doc):
    """Convert ObjectId fields to strings for JSON serialization"""
    doc["_id"] = str(doc["_id"])
    if "platId" in doc:
        doc["platId"] = str(doc["platId"])
    return doc

# ---------------- ROUTES ----------------

# GET all categories


@app.route("/categories", methods=["GET"])
def get_categories():
    categories = list(db.categories.find())
    categories = [serialize_doc(cat) for cat in categories]
    return jsonify(categories)

# GET all menu items


@app.route("/menu", methods=["GET"])
def get_menu():
    menu = list(db.menu.find())
    menu = [serialize_doc(item) for item in menu]
    return jsonify(menu)

# GET menu items by category ID


@app.route("/menu/category/<cat_id>", methods=["GET"])
def get_menu_by_category(cat_id):
    menu = list(db.menu.find({"platId": cat_id}))
    menu = [serialize_doc(item) for item in menu]
    return jsonify(menu)


# ---------------- RUN ----------------
if __name__ == "__main__":
    app.run(debug=True, port=5000)
