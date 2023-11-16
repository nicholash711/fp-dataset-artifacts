import os
import json

analysis_dir = "./nli_test_analysis/"

def main():
    f = open("./output/eval_predictions.jsonl", )
    json_list = list(f)
    
    f.close()
    
    f = open(analysis_dir + "correct_predictions.jsonl", "w")
    
    for entry in json_list[:100]:
        js = json.loads(entry)
        if js["label"] == js["predicted_label"]:
            f.write(entry)
            
    f.close()



if __name__ == "__main__":
    main()