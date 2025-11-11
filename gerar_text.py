from clipboard import copy

info = open('gerar_text.txt', 'r', encoding='utf-8').read()
info = info.replace('\n','\\n')
info = info.replace('"','\\"')
info = info.replace('example','{{module}}')
info = info.replace('Example','{{class}}')
info = info.replace('exampleModule','{{var}}')

copy(info)
