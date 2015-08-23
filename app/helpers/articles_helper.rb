module ArticlesHelper
	def month_name_from (number, ext)
    months = ['GEN','FEB','MAR','APR','MAG','GIU','LUG','AGO','SET','OTT','NOV','DIC']
    months_extended = ['Gennaio','Febbraio','Marzo','Aprile','Maggio','Giugno','Luglio','Agosto','Settembre','Ottobre','Novembre','Dicembre']
    ext ? months_extended[number-1] : months[number-1]
  end
end
