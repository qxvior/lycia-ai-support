from transformers import AutoTokenizer, AutoModelForSeq2SeqLM

# Load the pre-trained CodeT5 model and tokenizer
model_name = "Salesforce/codet5-base"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForSeq2SeqLM.from_pretrained(model_name)

# Input 4GL code snippet
input_code = """
MAIN
display 'test AI'
"""

# Tokenize input
inputs = tokenizer(input_code, return_tensors="pt", padding=True)

# Generate completion
outputs = model.generate(inputs["input_ids"], max_length=50, num_return_sequences=1)
generated_code = tokenizer.decode(outputs[0], skip_special_tokens=True)

print("Input Code:")
print(input_code)
print("\nGenerated Completion:")
print(generated_code)
