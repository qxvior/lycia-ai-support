import re
import json

def parse_bison_file(file_path):
    with open(file_path, 'r') as file:
        content = file.read()

    # Regular expression to match grammar rules in Bison format
    rule_pattern = re.compile(r'(\w+)\s*:\s*(.*?)\s*;', re.DOTALL)

    # Find all matches in the file content
    matches = rule_pattern.findall(content)

    # Prepare the grammar rules in a structured format
    grammar_rules = []
    for match in matches:
        lhs = match[0]  # Left-hand side of the rule
        rhs = match[1]  # Right-hand side of the rule

        # Split the right-hand side into individual symbols
        symbols = [s.strip() for s in rhs.split()]

        # Create a dictionary for the rule
        rule = {
            "lhs": lhs,
            "rhs": symbols
        }

        grammar_rules.append(rule)

    return grammar_rules

def save_to_json(grammar_rules, output_file):
    with open(output_file, 'w') as json_file:
        json.dump(grammar_rules, json_file, indent=4)

if __name__ == "__main__":
    # Path to the Bison file
    bison_file_path = 'fglm.y'

    # Path to the output JSON file
    output_json_path = '4gl_grammar_rules.json'

    # Parse the Bison file and extract grammar rules
    grammar_rules = parse_bison_file(bison_file_path)

    # Save the grammar rules to a JSON file
    save_to_json(grammar_rules, output_json_path)

    print(f"Grammar rules have been extracted and saved to {output_json_path}")