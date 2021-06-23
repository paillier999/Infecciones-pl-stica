#Configuración de git hub

install.packages("usethis")
library(usethis)
use_git_config(user.name = "paillier999", user.email = "paillier999@hotmail")


#Importación de datos de sede sur
library(readxl)
procedi_2020 <- read_excel("datos/procedi_2020.xls")
View(procedi_2020)

names(procedi_2020)

#Seleccionando solo los procedimientos de cx plástica (MESTECTOMIAS Y LIPECTOMIAS)y variables de interés
plastico<- procedi_2020 %>% 
filter(MENomE=="CIRUGIA PLASTICA Y ESTETICA", NombreProc==c("MAMOPLASTIA DE REDUCCION BILATERAL",
                                                            "MAMOPLASTIA DE REDUCCION UNILATERAL",
                                                            "REDUCCION DE TEJIDO ADIPOSO DE PARED ABDOMINAL, POR LIPECTOMIA",
                                                            "REDUCCION DE TEJIDO ADIPOSO DE PARED ABDOMINAL POR LIPECTOMIA",
                                                            "REDUCCION DE TEJIDO ADIPOSO EN MUSLOS, PELVIS, GLUTEOS O BRAZOS, POR LIPECTOMIA",
                                                            "REDUCCION DE TEJIDO ADIPOSO EN MUSLOS PELVIS GLUTEOS O BRAZOS POR LIPECTOMIA")) %>% 
  select(c(NombreProc, NombreMedico, CEDULA, Responsable, FechaCirugia, HoraInicioReal, HiraFinalReal, quirofano,
           FechaIngreso, Fechaegreso, telefono, Edad, Horas, Días, 'AÑO CX', 'MES CX' ))

plastico %>%
  group_by(NombreProc,`MES CX`) %>%
  summarise(Total=n()) %>% 
  arrange(`MES CX`)
 
plastico %>%
    summarise(Total=n())
