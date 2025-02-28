import pytest
from app import app  # Make sure your app.py file exposes a Flask `app` instance

@pytest.fixture
def client():
    """Fixture to create a Flask test client"""
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    """Tests the main route"""
    response = client.get("/")
    assert response.status_code == 200
    assert response.json == {"message": "Microservice API is running!"}

def test_404(client):
    """Tests a non-existent route"""
    response = client.get("/nonexistent")
    assert response.status_code == 404
