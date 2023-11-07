from bs4 import BeautifulSoup

page = open('product_view.html', 'rt', encoding='utf-8').read()
soup = BeautifulSoup(page, 'html.parser')

# print(soup.prettify)
# print(soup.find_all('th'))

header = soup.find('th')
# print(header)
td = header.find_next_sibling('td')
# print(td.get('id'))

elements = soup.select('table.tableType tr > th')
#print(elements)
tds = soup.select('table.tableType tr > td')
#print(tds)

"""
for index, element in enumerate(elements, 1):
    print("{} {}".format(index, element.text))
"""

for i in range(0, len(elements)):
    if tds[i].find('ul'):
        id = tds[i].find('ul').get('id')
    else:
        id = tds[i].get('id')    
    print("{0:<30} {1:<20}".format(id, elements[i].text))