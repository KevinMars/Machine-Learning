import survey
table = survey.Pregnancies()
table.ReadRecords()
print 'Number of pregnancies', len(table.records)

births = [x for x in table.records if x.outcome == 1]

first = [y for y in table.records if y.birthord == 1]
other = [y for y in table.records if y.birthord > 1]

gestation_first = [z.prglength for z in first]
gestation_other = [z.prglength for z in other]

def Mean(t):
	return float(sum(t)) / len(t)

mu_first = Mean(gestation_first)
mu_other = Mean(gestation_other)

print len(births)
print len(first)
print len(other)
print mu_first
print mu_other

