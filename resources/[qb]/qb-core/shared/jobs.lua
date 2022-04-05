QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Arbejdsløs',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Kontanthjælp',
                payment = 1000
            },
        },
	},
	['police'] = {
		label = 'Politi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Elev',
                payment = 3000
            },
			['1'] = {
                name = 'Betjent',
                payment = 5000
            },
			['2'] = {
                name = 'Sheriff',
                payment = 5000
            },
			['3'] = {
                name = 'Swat',
                payment = 7500
            },
			['4'] = {
                name = 'Ledelse',
				isboss = true,
                payment = 10000
            },
        },
	},
	['ambulance'] = {
		label = 'Læge',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Elev',
                payment = 2000
            },
			['1'] = {
                name = 'Ambulanceredder',
                payment = 4000
            },
			['2'] = {
                name = 'Akutlæge',
                payment = 5000
            },
			['3'] = {
                name = 'ViceChef',
                payment = 5000
            },
			['4'] = {
                name = 'Chef',
				isboss = true,
                payment = 7500
            },
        },
	},
	['realestate'] = {
		label = 'Ejendomsmægler',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Elev',
                payment = 1000
            },
			['1'] = {
                name = 'Hus Sælger',
                payment = 2000
            },
			['2'] = {
                name = 'Dekoratør',
                payment = 3000
            },
			['3'] = {
                name = 'Vice Manager',
                payment = 4000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 5000
            },
        },
	},
	['taxi'] = {
		label = 'Taxa',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Chauffør',
                payment = 1000
            },
			['1'] = {
                name = 'Chauffør',
                payment = 1000
            },
			['2'] = {
                name = 'Event Chauffør',
                payment = 3000
            },
			['3'] = {
                name = 'Vice Manager',
                payment = 4000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 5000
            },
        },
	},
     ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Chauffør',
                payment = 1000
            },
		},
	},
	['cardealer'] = {
		label = 'Bilforhandler',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Elev',
                payment = 2000
            },
			['1'] = {
                name = 'Normal',
                payment = 3000
            },
			['2'] = {
                name = 'Luksus Sælger',
                payment = 5000
            },
			['3'] = {
                name = 'Vice Manager',
                payment = 6000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 7000
            },
        },
	},
	['mechanic'] = {
		label = 'Mekaniker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Elev',
                payment = 2000
            },
			['1'] = {
                name = 'Begynder',
                payment = 3000
            },
			['2'] = {
                name = 'Erfaren',
                payment = 4000
            },
			['3'] = {
                name = 'Vice Manager',
                payment = 5000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 7500
            },
        },
	},
	['judge'] = {
		label = 'Dommer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Normal',
                payment = 3000
            },
        },
	},
	['lawyer'] = {
		label = 'Advokat',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Normal',
                payment = 3000
            },
        },
	},
	['reporter'] = {
		label = 'Rapporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 1000
            },
        },
	},
	['trucker'] = {
		label = 'Lastbil',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Chauffør',
                payment = 1000
            },
        },
	},
	['tow'] = {
		label = 'Tow',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Chauffør',
                payment = 1000
            },
        },
	},
	['garbage'] = {
		label = 'Skraldemand',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Samler',
                payment = 1000
            },
        },
	},
	['vineyard'] = {
		label = 'Vingård',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Samler',
                payment = 1000
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sælger',
                payment = 1000
            },
        },
	},
}