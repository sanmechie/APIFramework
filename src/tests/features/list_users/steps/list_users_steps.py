import json
from behave import then
from src.tests.utils.helper import validate_json
import src.tests.features.common.steps

    
@then('I recieve empty response')
def step_impl(context):
    if bool(context.response_text):
        raise AssertionError("Json is not empty for user who doesnt exist")


@then('I recieve a valid user_schema as json response')
def step_impl(context):
    context.user_schema = json.loads(context.text)
    val = validate_json(context.response_text, context.user_schema)
    assert val is True, val
    