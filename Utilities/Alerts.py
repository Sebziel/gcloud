from datetime import date

var1 = date.today()
var3 = date.strftime(var1, '%A')

#print(var1)
#print(var2)
#print(var3)

listaPon = ['cron1', 'cron2', 'cron3']
listaPt = ['cron4', 'cron5', 'cron6']
listaSb = ['cron7', 'cron8', 'cron9']

def switchOn(lista):
    for crony in (lista):
        print(crony + ' Curl na każdego crona')

#switchOn(listaPon)

print(var3)

match var3:
    case "Monday":
        switchOn(listaPon)
    case "Friday":
        switchOn(listaPt)
    case "Saturday":
        switchOn(listaSb)