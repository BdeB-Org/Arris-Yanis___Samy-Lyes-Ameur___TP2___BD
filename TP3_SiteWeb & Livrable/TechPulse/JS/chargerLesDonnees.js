function chargerTable(url, idElement, colonnes) {
  fetch(url)
    .then(res => res.json())
    .then(donnees => {
      let contenu = "<table border='1'><tr>";

      
      for (let i = 0; i < colonnes.length; i++) {
        contenu += "<th>" + colonnes[i] + "</th>";
      }
      contenu += "</tr>";

      
      for (let i = 0; i < donnees.length; i++) {
        contenu += "<tr>";
        for (let j = 0; j < colonnes.length; j++) {
          contenu += "<td>" + donnees[i][colonnes[j]] + "</td>";
        }
        contenu += "</tr>";
      }

      contenu += "</table>";
      document.getElementById(idElement).innerHTML = contenu;
    })
    .catch(err => {
      document.getElementById(idElement).innerHTML = "<p style='color:red;'>Erreur lors du chargement</p>";
      console.log(err);
    });
}

window.onload = function () {
  chargerTable("../JSON/utilisateurs.json", "utilisateurs", ["id", "nom", "prenom", "email"]);
  chargerTable("../JSON/categories.json", "categories", ["id", "nom", "description"]);
  chargerTable("../JSON/articles.json", "articles", ["id", "titre", "categorie_id", "date"]);
};