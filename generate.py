import sys
import os
import json

def generate_folder(path):
    if not os.path.exists(path):
        os.makedirs(path)
        print(f'Pasta gerada: {path}')

def generate_file(path, text):
    with open(path, 'w') as f:
        f.write(text)
        print(f'Arquivo gerado: {path}')
        
def fist_letter_upper(module):
    return module[0].upper() + module[1:]

def generate(module):
    moduleStr = "{{module}}" # example: login_module
    classStr = "{{class}}" # example: LoginModule
    varStr = "{{var}}" # example: loginModule

    module = str(module).lower() # example: login_module
    splModule = module.split('_')
    varName = splModule[0]
    if len(splModule) > 1:
        for name in splModule[1:]:
            varName += fist_letter_upper(name)
    print(f'Generating module: {module}')
    dados = open('generate.json', 'r', encoding='utf-8').read()
    dados = json.loads(dados)
    for dado in dados:
        type_file = dado['type']
        name = str(dado['name']).replace(moduleStr, module)
        if type_file == 'folder':
            generate_folder(name)
        elif type_file == 'file':
            path = '/'.join(name.split('/')[:-1])
            generate_folder(path)
            text = str(dado['text']).replace(moduleStr, module)
            text = str(text).replace(varStr, varName)
            text = str(text).replace(classStr, fist_letter_upper(varName))
            generate_file(name, text)
            
        else:
            print(f'Tipo "{type_file}", não suportado...')
            

if __name__ == "__main__":
    module = sys.argv[1]
    if module == 'generate.py':
        module = sys.argv[2]
    generate(module)