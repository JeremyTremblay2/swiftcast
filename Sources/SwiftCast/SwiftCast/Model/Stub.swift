import Foundation

struct Stub {
    private var podcasts: [Podcast] = []
    private var menuSections: [MenuSection] = []
    
    public mutating func loadPodcasts() -> [Podcast] {
        guard podcasts.isEmpty else {
            return podcasts
        }
        
        podcasts.append(
            Podcast(withImage: "chaleur_humaine", withTitle: "Chaleur Humaine",
                    fromAuthor: "Le Monde", withNote: 4.8, fromManyReviews: 458, fromCategory: "Actualités",
                    withAPublicationFrequency: .everyWeek, withEpisodes: [
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 2),
                                withTitle: "7. Comment se libérer de la voiture individuelle ?",
                                withDescription: "**** Recevez gratuitement tous les mardis l'infolettre Chaleur humaine en vous inscrivant...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 49, withSeconds: 10)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 4, fromDay: 25),
                                withTitle: "6. Gestes individuels et actions collectives, comment agir pour le climat ? (EN PUBLIC)",
                                withDescription: "**** Recevez gratuitement tous les mardis l'infolettre Chaleur humaine en vous inscrivant...",
                                withDuration: generateDuration(withHours: 1, withMinutes: 4, withSeconds: 18)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 4, fromDay: 18),
                                withTitle: "5. Climat: la transition va t-elle créer ou détruire des emplois ? ",
                                withDescription: "**** Recevez gratuitement tous les mardis l'infolettre Chaleur humaine en vous inscrivant...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 46, withSeconds: 25)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 4, fromDay: 25),
                                withTitle: "4. Faut-il arrêter de prendre l'avion ?",
                                withDescription: "**** Recevez gratuitement tous les mardis l'infolettre Chaleur humaine en vous inscrivant là\nLe secteur aérien pèse environ 2,5% des...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 45, withSeconds: 34)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 4, fromDay: 25),
                                withTitle: "3. La Chine peut-elle réussir sa transition climatique ?",
                                withDescription: "**** Recevez gratuitement tous les mardis l'infolettre Chaleur humaine en vous inscrivant...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 33, withSeconds: 30)),
                    ]
            )!)
        podcasts.append(
            Podcast(withImage: "la_science_cqfd", withTitle: "La Science, CQFD",
                    fromAuthor: "France Culture", withNote: 4.4, fromManyReviews: 1800, fromCategory: "Sciences",
                    withAPublicationFrequency: .unknow, withEpisodes: [
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 2),
                                withTitle: "ADN poubelle : tout n'est pas à jeter",
                                withDescription: "durée : 00:58:16 - La Science CQFD - par Natacha Triou - Au début des années 2000, les scientifiques se sont aperçus de la présence d'...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 58, withSeconds: 16), isAlreadyPlayed: true),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 2),
                                withTitle: "Le néant est-il un bon à rien ?",
                                withDescription: "durée : 00:4:41 - Le pourquoi du comment : science - par Etienne Klein - Le néant, la grande question !",
                                withDuration: generateDuration(withHours: 0, withMinutes: 4, withSeconds: 41)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 1),
                                withTitle: "\"La Naissance du savoir\" : les grands esprits scientifiques se rencontrent ",
                                withDescription: "durée : 00:58:34 - La Science CQFD - par Natacha Triou - Le cerveau est semblable à un...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 58, withSeconds: 34)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 1),
                                withTitle: "Comment la notion d'énergie noire est-elle née ?",
                                withDescription: "durée : 00:4:03 - Le pourquoi du comment : science - par Etienne Klein - Savez-vous pour...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 4, withSeconds: 3)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 1),
                                withTitle: "Le coeur de la Lune renferme une graine, comme la Terre",
                                withDescription: "durée : 00:5:06 - Le pourquoi du comment : science - par Etienne Klein - Savez-vous pour...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 5, withSeconds: 6)),
                    ]
            )!
        )
        podcasts.append(
            Podcast(withImage: "le_code_a_change", withTitle: "Le code à changé",
                    fromAuthor: "France Culture", withNote: 4.8, fromManyReviews: 539, fromCategory: "Actualités technologiques",
                    withAPublicationFrequency: .unknow, withEpisodes: [
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 2),
                                withTitle: "Silicon Valley, \"l'art de la guerre avec le sourire\"",
                                withDescription: "durée : 01:02:01 - Le code à changé - On passe toute une partie de  nos vies dans la Silicon Valley...",
                                withDuration: generateDuration(withHours: 1, withMinutes: 02, withSeconds: 01)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 4, fromDay: 11),
                                withTitle: "L'ère des propagations",
                                withDescription: "durée : 00:56:11 - \"Contagion\", le film de Steven Soderbergh sorti en 2011 a pris une toute autre dimension au mo...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 56, withSeconds: 11))
                    ]
            )!
        )
        podcasts.append(
            Podcast(withImage: "open_jazz", withTitle: "Open jazz",
                    fromAuthor: "France Musique", withNote: 4.3, fromManyReviews: 182, fromCategory: "Musique",
                    withAPublicationFrequency: .unknow, withEpisodes: [
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 2),
                                withTitle: "Nana Rashid, little North, grande voix",
                                withDescription: "durée : 00:54:24 - Nana Rashid - par : Alex Dutilh - Avec une qualité vocale intemporelle et émotive qui rappelle la grande Nina Simone, la...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 54, withSeconds: 24)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 1),
                                withTitle: "Laurent Cugny prend l'air du temps",
                                withDescription: "durée : 00:54:52 - Laurent Cugny - par : Alex Dutilh - Avec \"Zeitgeist\" qui paraît chez Frémeaux et Associés, Laurent Cugny esquisse...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 54, withSeconds: 52)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 4, fromDay: 28),
                                withTitle: "Avishai Cohen & Abraham Rodriguez Jr., ladino un jour, ladino toujours",
                                withDescription: "durée : 00:54:40 - Avishai Cohen & Abraham Rodriguez Jr. - par : Alex Dutilh - La contrebass...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 54, withSeconds: 40)),
                    ]
            )!
        )
        podcasts.append(
            Podcast(withImage: "le_moment_meurice", withTitle: "Le moment Meurice",
                    fromAuthor: "France Inter", withNote: 4.6, fromManyReviews: 4232, fromCategory: "Actualités technologiques",
                    withAPublicationFrequency: .unknow, withEpisodes: [
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 5, fromDay: 2),
                                withTitle: "Leçon de créole",
                                withDescription: "durée : 00:03:53 - Le moment Meurice - par : Guillaume Meurice - Aujourd'hui, Guillaume Meurice est en direct de la Réunion où il a reçu une leçon de créole.",
                                withDuration: generateDuration(withHours: 0, withMinutes: 02, withSeconds: 53)),
                        Episode(withDate: generateDate(fromYear: 2023, fromMonth: 4, fromDay: 28),
                                withTitle: "Macron vu de la réunion",
                                withDescription: "durée : 00:03:49 - Le moment Meurice - par : Guillaume Meurice - Aujourd'hui, Guillaume Meurice est en direct de la Réunion où il a de...",
                                withDuration: generateDuration(withHours: 0, withMinutes: 03, withSeconds: 49))
                    ]
            )!
        )
        
        return podcasts
    }
    
    public mutating func loadMenuSections() -> [MenuSection] {
        guard menuSections.isEmpty else {
            return menuSections
        }
        
        menuSections.append(MenuSection(withImage: "square.stack", withName: "Podcasts"))
        menuSections.append(MenuSection(withImage: "checklist.unchecked", withName: "Channels"))
        menuSections.append(MenuSection(withImage: "bookmark", withName: "Saved"))
        menuSections.append(MenuSection(withImage: "arrow.down.circle", withName: "Downloads"))
        menuSections.append(MenuSection(withImage: "clock", withName: "Last Episods"))
        
        return menuSections
    }
    
    private func generateDate(fromYear year: Int, fromMonth month: Int, fromDay day: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        let userCalendar = Calendar(identifier: .gregorian)
        return userCalendar.date(from: dateComponents) ?? Date.now
    }
    
    private func generateDuration(withHours hours: Int, withMinutes minutes: Int, withSeconds seconds: Int) -> Duration {
        .seconds(seconds + minutes * 60 + hours * 3600)
    }
}
