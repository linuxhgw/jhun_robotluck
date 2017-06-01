import  yaml 
import os
import shutil 

print(os.getcwd())

f = open('_config.yml')
s = yaml.load(f)

theme = s["theme"]
print("Current Theme:", theme)

shutil.copy("themes_config/{}/_config.yml".format(theme), "themes/{}/".format(theme))

print("Apply theme ", theme)