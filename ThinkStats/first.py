import survey

table = survey.Pregnancies()
table.ReadRecords()
print 'Number of pregnancies: ', len(table.records)

births = [x for x in table.records if x.outcome == 1]

first = [y for y in table.records if y.birthord == 1]
other = [y for y in table.records if y.birthord > 1]

gestation_first = [z.prglength for z in first]
gestation_other = [z.prglength for z in other]

def Mean(t):
	return float(sum(t)) / len(t)

mu_first = Mean(gestation_first)
mu_other = Mean(gestation_other)


print "Number of live births: ", len(births)
print "Number of 1st children: ", len(first)
print "Number of not 1st children: ", len(other)
print "Average gestation period of 1st child: ", mu_first
print "Average gestation period, not 1st child: ", mu_other

