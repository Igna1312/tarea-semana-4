# Using R

# Option 2: Read directly from GitHub

attribution_studies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-08-12/attribution_studies.csv')
attribution_studies_raw <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-08-12/attribution_studies_raw.csv')

#paquetes que pueden servir
install.packages("ggplot2")
install.packages("tidyverse")

library(ggplot2)
library(tidyverse)
#ANALISIS EXPLORATORIO

dim(attribution_studies)
head(attribution_studies)
summary(attribution_studies)
print(attribution_studies)
#GRAFICOS PARA VARIABLES DEL CODIGO
#me ayudó a hacer esto stack overflow y los tutoriales de Riffomonas project en youtube para hacer los gráficos

#GRAFICO DE DISTRIBUCION DE EVENTOS POR REGION

ggplot(attribution_studies, aes(y = cb_region)) + geom_bar() + 
  labs(title = "Distribución de eventos y tendencias por región", x = "Cantidad de veces ocurrido", y = "Region")

#GRAFICO DE TIPOS DE EVENTOS
#elegí mostrarlo con la cantidad en X porque al ser muchos tipos las categorías se pegan mucho en el eje x

eventos_y_tendencias <- ggplot(attribution_studies, aes(y=event_type)) + geom_bar() + 
  labs(title = "Tipos de eventos y tendencias de cambio climático (1930-2024)" , 
       x = "Cantidad de veces ocurrido" , y = "Tipo de evento")
print(eventos_y_tendencias)

# AHORA EN LATAM: se ve mejor en eje X pero para darle continuidad seguí haciendolo en Y
#filtré los datos con la funcion %in% ya que como está en character no me dejaba usar
# la funcion [mis_datos == inserte valor] porque esto es para numérico
latam <- attribution_studies [attribution_studies$cb_region %in% c("Latin America and the Caribbean"), ]

eventos_y_tendencias_latam <- ggplot(latam, aes(y=event_type)) + geom_bar() + labs(title = 
        "Tipos de eventos y tendencias de cambio climático en Latinoamerica y el Caribe(1930-2024)" , x = "Cantidad de veces ocurrido",
        y = "Tipo de evento")
  print(eventos_y_tendencias_latam)

#AHORA POR POSIBILIDAD DE VOLVER A OCURRI
  
  clasificacion <- ggplot(attribution_studies, aes (y = classification)) + geom_bar() +
    labs(title = "Frecuencia de efectos adversos de cambio climático" , x = "Frecuencia" ,
         y = "Clasificación")
print(clasificacion) 
