import requests
from cerberus import Validator

def get_request(url, headers):
    """
    This makes a get request and returns a tuple containing
    status code and json response
    """
    res = requests.get(url, headers=headers)
    return res.status_code, res.json(), res.headers, res.elapsed.total_seconds()


def post_request(url, payload, headers):
    """
    This method makes a post request and returns a tuple containing
    status code and json response
    """
    res = requests.post(url, json=payload, headers=headers)
    return res.status_code, res.json(), res.headers, res.elapsed.total_seconds()


def validate_json(data, schema):
    """
    This method will return True if the json structure 
    matches the passed schema or will return errors
    """
    v = Validator()
    flag = False
    for i in data:
        if v.validate(i, schema):
            flag = True
        else:
            # exit on 1st error
            return v.errors
    return flag
