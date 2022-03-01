import json
from behave import  then
# import common steps
import src.tests.features.common.steps
    

    
@then("following details are returned")
def step_impl(context):
    assert context.response_text.get('title') == context.payload.get('title')
    assert context.response_text.get('body') == context.payload.get('body')
    assert context.response_text.get('userId') == context.payload.get('userId')
