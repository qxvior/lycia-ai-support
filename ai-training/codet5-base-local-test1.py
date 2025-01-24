from transformers import AutoTokenizer, AutoModelForCausalLM

# Load the pre-trained model and tokenizer
model_name = "Salesforce/codet5-base"  # Replace with "bigcode/starcoder" for StarCoder
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name)

# Input 4GL code snippet
input_code = """
MAIN
CALL dsply_logo(3)
END MAIN
"""

# Tokenize input
inputs = tokenizer(input_code, return_tensors="pt")

# Generate completion
outputs = model.generate(inputs["input_ids"], max_length=50, num_return_sequences=1)
generated_code = tokenizer.decode(outputs[0], skip_special_tokens=True)

print("Input Code:")
print(input_code)
print("\nGenerated Completion:")
print(generated_code)
