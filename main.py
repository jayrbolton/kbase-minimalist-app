import json
import sys


if __name__ == '__main__':
    input_path = sys.argv[1]  # input.json
    output_path = sys.argv[2]  # output.json
    print('input_path is', input_path)
    print('output_path is', output_path)
    with open(input_path, 'r', encoding='utf8') as input_file:
        input_json = json.load(input_file)
    method = input_json['method']
    message = input_json['params'][0]['message']
    output_data = {
        "id": input_json.get('id'),
        "result": {
            "message": message
        },
        "cancelled": 0,
        "error": None
    }
    with open(output_path, 'w', encoding='utf8') as output_file:
        json.dump(output_data, output_file)
