#Configuración de git hub, previamente he creado el repositorio en la pàgina de
#git hub La creación de repositorias tambièn se puede hacer con gib hub desktop

install.packages("usethis")
library(usethis)
use_git_config(user.name = "paillier999", user.email = "paillier999@hotmail")

library(tidyverse)

#Importación de datos de sede sur
library(readxl)
procedi_2020 <- read_excel("datos/procedi_2020.xls")
View(procedi_2020)
names(procedi_2020)

#mutando variable "semestre"

procedi_2020 <- procedi_2020 %>% 
  mutate(semestre=case_when(`MES CX` %in% c(1,2,3,4,5,6) ~ "primero", 
                            `MES CX` %in% c(7,8,9,10,11,12) ~ "segundo"))

#Total de procedimientos solo para cx plástica
procedi_2020 %>% 
  filter(MENomE=="CIRUGIA PLASTICA Y ESTETICA") %>% 
  summarise(Total=n())


procedi_2020 %>% 
  filter(MENomE=="CIRUGIA PLASTICA Y ESTETICA") %>% 
           group_by(semestre) %>% 
           summarise(Total=n())



#Seleccionando solo los procedimientos de cx plástica (MESTECTOMIAS Y 
# LIPECTOMIAS) Màs variables de interés para sede sur del año 2020
plastico<- procedi_2020 %>% 
filter(MENomE=="CIRUGIA PLASTICA Y ESTETICA", NombreProc %in% c("mamoplastia",
"lipectomia abdominal", "lipectomia otros sitios")) %>% 
  select(c(NombreProc, NombreMedico, CEDULA, Responsable, FechaCirugia, 
           HoraInicioReal, HiraFinalReal, quirofano, FechaIngreso, Fechaegreso, 
           telefono, Edad, Horas, Días, 'AÑO CX', 'MES CX', semestre ))

#Total de plos procedimientos especificados para el 2020, por tipo de pto,
#mes y semestre
plastico %>%
  summarise(Total=n())


plastico %>%
  group_by(NombreProc, semestre) %>%
  summarise(Total=n())

plastico %>%
  group_by(`MES CX`) %>%
  summarise(Total=n())

plastico %>%
  group_by(semestre) %>%
  summarise(Total=n())

#proximamente se cruzarà base de datos con reingresos.
# se agrega a la carpeta datos las cirugías desde segundo semestre de 2018 hasta 2020
#Pendiente primer semestre de 2021


