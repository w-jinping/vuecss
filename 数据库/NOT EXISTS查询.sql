Select SNAME FROM S Where NOT EXISTS(Select * FROM SC,C Where SC.CNO=C.CNO AND CNAME='����' AND SC.SNO=S.SNO)
