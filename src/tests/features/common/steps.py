import json
from behave import given, when, then
from src.tests.utils.helper import get_request, post_request
from src.tests.utils.project_constants import URI
from loguru import logger
request_headers = {}

@given('I Set JSON Place Holder Service URL')
def step_impl(context):
    context.api_url = f'{URI}'
    logger.info(f'Base URI is {context.api_url} \n')


@given('I Set "{method_type}" "{endpoints}" api endpoint users')
def step_impl(context, method_type, endpoints):
    context.method = method_type
    # updating URI with exact end point as per scenario
    context.api_url = context.api_url + f'/{endpoints}'
    logger.info(f'End point being tested is {context.api_url}')


@when('I Set HEADER param request content type as "{header_content_type}"')
def step_impl(context, header_content_type):
    context.header_content_type = header_content_type


@when('Send HTTP request')
def step_impl(context):
    # setting headers
    request_headers['Content-type'] = context.header_content_type
    logger.info(f'Sending {context.method} Request')
    if context.method == "GET":
        context.status_code, context.response_text, context.response_headers, context.response_time = get_request(context.api_url, request_headers)
    if context.method == 'POST':
        context.status_code, context.response_text, context.response_headers, context.response_time = post_request(context.api_url, payload=context.payload, headers=request_headers)


@then('I recieve "{status_code}" as HTTP code')
def step_impl(context, status_code):
    assert context.status_code == int(status_code), f"Actual status code is {context.status_code} while expected is {status_code}"
    
@then('I recieve response time less than "{response_time}" second')
def step_impl(context, response_time):
    assert context.response_time < int(response_time), f"Actual status code is {context.response_time} while expected is {response_time}"
    

@then('I recieve header containing "{header_type}" as "{header_value}"')
def step_impl(context, header_type, header_value):
    actual_header = context.response_headers.get(header_type)
    assert actual_header == header_value, f"Actual header code is {actual_header} while expected is {header_value}"
    
@when('set a "{payload}"')
def step_impl(context, payload):
    # setting payload to be used for making post request
    context.payload = json.loads(payload)
