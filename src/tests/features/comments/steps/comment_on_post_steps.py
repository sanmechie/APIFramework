import json
from behave import  then
# import common steps
import src.tests.features.common.steps
    


    
@then("following details are returned")
def step_impl(context):
    assert context.response_text.get('postId') == context.payload.get('postId')
    assert context.response_text.get('name') == context.payload.get('name')
    assert context.response_text.get('email') == context.payload.get('email')
    assert context.response_text.get('body') == context.payload.get('body')