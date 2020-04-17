Speech.init(16);
Speech.channels[0].speak("hallo");
Speech.channels[0].isActive;
//Speech.channels[0].voice_(8);
Speech.channels[0].speak("IDEOLOGICALLY");
Speech.channels[0].pitch_(90);
Speech.channels[0].rate_(0.1);
Speech.channels[0].stop(\immediate);
Speech.channels[0].stop(\endOfWord);
Speech.channels[0].stop(\endOfSentence);
Speech.setSpeechRate(20);
(Speech.channels[0].speak("
Algo grande está naciendo
En la década de los ochenta
Ya se siente en la atmósfera
Saturada de aburrimiento
Los hippies y los punks
Tuvieron la ocasión
De romper el estancamiento
En las garras de la comercialización
Murió toda la buena intención
Las juventudes cacarearon bastante
Y no convencen ni por sólo un instante
Pidieron comprensión, amor y paz
Con frases hechas muchos años atrás
Deja la inercia de los setenta,
Abre los ojos, ponte de pie
Escucha el latido, sintoniza el sonido,
Agudiza tus sentidos
Date cuenta que estás vivo
Ya viene la fuerza la voz de los ochenta
En Roma, Lima y en Santander
La gente de tu edad no sabe qué hacer
Santiago, Asunción y también Buenos Aires,
Bueno, las cosas no están que arden
Sangre latina necesita el mundo,
Roja furiosa y adolescente
Sangre latina necesita el planeta
Adiós barreras! Adiós setentas!
Ya viene la fuerza la voz de los ochenta
En plena edad del plástico
Seremos fuerza, seremos cambio
No te conformes con mirar
En los ochenta tu rol es estelar
Tienes la fuerza eres actor principal
De las entrañas de nuestras ciudades
Surge la piel que vestir al mundo
Ya viene la fuerza la voz de los ochenta
Se escucha el murmullo algo se siente venir
Los últimos vientos de los setenta se mueren
Mira nuestra juventud,
Que alegra más triste y falsa
Deja la inercia de los setenta,
Abre los ojos, ponte de pie
Escucha el latido, sintoniza el sonido,
Agudiza tus sentidos
Date cuenta que estás vivo
Ya viene la fuerza la voz de los ochenta
");)



(Speech.channels[1].speak("
A veces voy donde reina el mar
es mi lugar llego sin disfraz
por un minuto abandono el frac
y me descubro en lo espiritual
para amar
como si fuera
mentiroso y nudista
en taxi voy hotel Savoy y bailamos
y ya no se si es hoy, ayer o mañana
ou ou ou o o o


Fue ayer, persiste el olor
de esa piel, morena y sensual,
perfumada
y hoy me visto de model naval
no me preocupa parecer vulgar
como si fuera
mentiroso y nudista
en taxi voy hotel Savoy y bailamos
y ya no se si es hoy ayer o mañana
ou ou ou o o ouuu
ou ou ou o o ouuu
ou ou ou o o ouuu


tara ra lara lara
tara ra lara lara
tara ra lara lara
tara ra lara lara
");)



(
Speech.init(16);

Task({
    4.do ({arg i;
        [0.1, 0.18, 0.2, 1.0].choose.wait;
        Speech.setSpeechRate(i,[180, 90,60,30,15].choose);
        Speech.setSpeechVolume(i,0.07);
        "
A veces voy donde reina el mar
es mi lugar llego sin disfraz
por un minuto abandono el frac
y me descubro en lo espiritual
para amar
como si fuera
mentiroso y nudista
en taxi voy hotel Savoy y bailamos
y ya no se si es hoy, ayer o mañana
ou ou ou o o o


Fue ayer, persiste el olor
de esa piel, morena y sensual,
perfumada
y hoy me visto de model naval
no me preocupa parecer vulgar
como si fuera
mentiroso y nudista
en taxi voy hotel Savoy y bailamos
y ya no se si es hoy ayer o mañana
ou ou ou o o ouuu
ou ou ou o o ouuu
ou ou ou o o ouuu


tara ra lara lara
tara ra lara lara
tara ra lara lara
tara ra lara lara
".speak(i);
    });
}).play;
)