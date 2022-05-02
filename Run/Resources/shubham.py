try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword

    ROBOT = False
except Exception:
    ROBOT = False

list_1 = [('PASS', 'Weekly Call'), ('PASS', 'Listing Creation'), ('PASS', 'Listing Compliance'),
          ('PASS', 'Brand Registry Consultation'), ('PASS', 'Reporting'), ('PASS', 'Holiday and Seasonal Preparation'),
          ('PASS', 'Promotion Planning and Support'), ('PASS', 'Review Strategy'), ('PASS', 'Total Managed Ad Spend'),
          ('PASS', 'Channel Governance Consultation'),
          ('FAIL', 'Element with locator \'//table[@class=" contact-list "]//tr [5]//td [2]\' not found.'),
          ('FAIL', 'Element with locator \'//table[@class=" contact-list "]//tr [5]//td [3]\' not found.')]
# list_2 = ['Expert Strategy and Consultation','Strategic Plan','Catalog Management and Organization','Seller Performance Consultation']
list_3 = ['Weekly Call', 'Listing Creation', 'Listing Compliance', 'Brand Registry Consultation', 'Reporting',
          'Holiday and Seasonal Preparation', 'Promotion Planning and Support', 'Review Strategy',
          'Total Managed Ad Spend']


# x = len(list_3)
# print(x)


def main(n):
    list_4 = []
    c = len(n)
    for i in range(0, int(c)):
        x = n[i]
        y = []
        z = y.append('PASS')
        p = y.append(x)
        q = tuple(y)
        r = list_4.append(q)
    return list_4


def length_of_list(n):
    return "length: ", print(len(n))


# length_of_list(list_1)

# a = main()
# print(a)
