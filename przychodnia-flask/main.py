from flask import Flask, render_template, request, url_for, flash, redirect
from flask_mysqldb import MySQL

app = Flask(
    __name__, static_url_path="", static_folder="static", template_folder="templates"
)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "przychodnia"

mysql = MySQL(app)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/lekarze", methods=("GET", "POST"))
def strona_lekarze():
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        if id is not None:
            sql = "DELETE FROM lekarze WHERE id_lekarza = %s"
            cursor.execute(sql, (id,))
            mysql.connection.commit()
        else:
            imie = request.form["imie_lek"]
            nazwisko = request.form["nazwisko_lek"]
            email = request.form["email"]
            telefon = request.form["telefon"]
            specjalizacja = request.form["specjalizacja"]

            if len(imie) < 3:
                error_string += "Niepoprawne imię! "
            if len(nazwisko) < 3:
                error_string += "Niepoprawne nazwisko! "

            if len(error_string) == 0:
                sql = "INSERT INTO lekarze (imie_lek, nazwisko_lek, specjalizacja, telefon, email) VALUES (%s, %s, %s, %s, %s)"
                cursor.execute(sql, (imie, nazwisko, specjalizacja, telefon, email))
                mysql.connection.commit()

    cursor.execute(
        """ SELECT id_lekarza, imie_lek, nazwisko_lek, specjalizacja, telefon, email FROM lekarze; """
    )
    data = cursor.fetchall()

    cursor.close()
    return render_template("lekarze.html", data=data, error_string=error_string)


@app.route("/edytuj_lekarza", methods=("GET", "POST"))
def edytuj_lekarza():
    id = request.args.get("id")
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        imie = request.form["imie_lek"]
        nazwisko = request.form["nazwisko_lek"]
        specjalizacja = request.form["specjalizacja"]
        telefon = request.form["telefon"]
        email = request.form["email"]

        if len(imie) < 3:
            error_string += "Niepoprawne imię. "
        if len(nazwisko) < 3:
            error_string += "Niepoprawne nazwisko. "

        if len(error_string) == 0:
            sql = "UPDATE lekarze SET imie_lek = %s, nazwisko_lek = %s, specjalizacja = %s, telefon = %s, email = %s WHERE id_lekarza = %s"
            cursor.execute(sql, (imie, nazwisko, specjalizacja, telefon, email, id))
            mysql.connection.commit()

        return redirect("/lekarze")

    cursor.execute(
        """ SELECT id_lekarza, imie_lek, nazwisko_lek, specjalizacja, telefon, email FROM lekarze WHERE id_lekarza = %s; """,
        (id,),
    )
    data = cursor.fetchall()

    cursor.close()
    return render_template(
        "edytuj_lekarza.html",
        error_string=error_string,
        id=data[0][0],
        imie_lek=data[0][1],
        nazwisko_lek=data[0][2],
        specjalizacja=data[0][3],
        telefon=data[0][4],
        email=data[0][5],
    )


@app.route("/pacjenci", methods=("GET", "POST"))
def strona_pacjenci():
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        if id is not None:
            sql = "DELETE FROM pacjenci WHERE id_pacjenta = %s"
            cursor.execute(sql, (id,))
            mysql.connection.commit()
        else:
            imie = request.form["imie"]
            nazwisko = request.form["nazwisko"]
            data_urodzenia = request.form["data_urodzenia"]
            adres = request.form["adres"]
            telefon = request.form["telefon"]
            email = request.form["email"]

            if len(imie) < 3:
                error_string += "Niepoprawne imię. "
            if len(nazwisko) < 3:
                error_string += "Niepoprawne nazwisko. "

            if len(error_string) == 0:
                sql = "INSERT INTO pacjenci (imie, nazwisko, data_urodzenia, adres, telefon, email) VALUES (%s, %s, %s, %s, %s, %s)"
                cursor.execute(
                    sql, (imie, nazwisko, data_urodzenia, adres, telefon, email)
                )
                mysql.connection.commit()

    cursor.execute(
        """ SELECT id_pacjenta, imie, nazwisko, data_urodzenia, adres, telefon, email FROM pacjenci; """
    )
    data = cursor.fetchall()

    cursor.close()
    return render_template("pacjenci.html", data=data, error_string=error_string)


@app.route("/edytuj_pacjenta", methods=("GET", "POST"))
def edytuj_pacjenta():
    id = request.args.get("id")
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        imie = request.form["imie"]
        nazwisko = request.form["nazwisko"]
        data_urodzenia = request.form["data_urodzenia"]
        adres = request.form["adres"]
        telefon = request.form["telefon"]
        email = request.form["email"]

        if len(imie) < 3:
            error_string += "Niepoprawne imię. "
        if len(nazwisko) < 3:
            error_string += "Niepoprawne nazwisko. "

        if len(error_string) == 0:
            sql = "UPDATE pacjenci SET imie = %s, nazwisko = %s, data_urodzenia = %s, adres = %s, telefon = %s, email = %s WHERE id_pacjenta = %s"
            cursor.execute(
                sql, (imie, nazwisko, data_urodzenia, adres, telefon, email, id)
            )
            mysql.connection.commit()

        return redirect("/pacjenci")

    cursor.execute(
        """ SELECT id_pacjenta, imie, nazwisko, data_urodzenia, adres, telefon, email FROM pacjenci WHERE id_pacjenta = %s; """,
        (id,),
    )
    data = cursor.fetchall()

    cursor.close()
    return render_template(
        "edytuj_pacjenta.html",
        error_string=error_string,
        id=data[0][0],
        imie=data[0][1],
        nazwisko=data[0][2],
        data_urodzenia=data[0][3],
        adres=data[0][4],
        telefon=data[0][5],
        email=data[0][6],
    )


@app.route("/wizyty", methods=("GET", "POST"))
def strona_wizyty():
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        if id is not None:
            sql = "DELETE FROM wizyty WHERE id_wizyty = %s"
            cursor.execute(sql, (id,))
            mysql.connection.commit()
        else:
            dane_pacjenta = request.form["id_pacjenta"].split("|")
            id_pacjenta = dane_pacjenta[0]
            imie = dane_pacjenta[1]
            nazwisko = dane_pacjenta[2]
            dane_lekarza = request.form["id_lekarza"].split("|")
            id_lekarza = dane_lekarza[0]
            imie_lek = dane_lekarza[1]
            nazwisko_lek = dane_lekarza[2]
            data_wizyty = request.form["data_wizyty"]
            godzina_wizyty = request.form["godzina_wizyty"]
            notatka = request.form["notatka"]
            czy_sie_odbyla = request.form["czy_sie_odbyla"]

            if len(imie) < 3:
                error_string += "Niepoprawne imię. "
            if len(nazwisko) < 3:
                error_string += "Niepoprawne nazwisko. "
            if len(imie_lek) < 3:
                error_string += "Niepoprawne imię. "
            if len(nazwisko_lek) < 3:
                error_string += "Niepoprawne nazwisko. "

            if len(error_string) == 0:
                sql = "INSERT INTO wizyty VALUES (null, %s, %s, %s, %s, %s, %s)"
                cursor.execute(
                    sql,
                    (
                        id_pacjenta,
                        id_lekarza,
                        data_wizyty,
                        godzina_wizyty,
                        notatka,
                        czy_sie_odbyla,
                    ),
                )
                mysql.connection.commit()

    cursor.execute(
        """ SELECT id_wizyty, imie, nazwisko, imie_lek, nazwisko_lek, data_wizyty, godzina_wizyty, notatka, czy_sie_odbyla FROM wizyty JOIN pacjenci ON wizyty.id_pacjenta = pacjenci.id_pacjenta JOIN lekarze ON wizyty.id_lekarza = lekarze.id_lekarza; """
    )
    data = cursor.fetchall()
    cursor.execute(
        """ SELECT id_lekarza, imie_lek, nazwisko_lek, specjalizacja FROM lekarze ORDER BY nazwisko_lek; """
    )
    lekarze = cursor.fetchall()
    cursor.execute(
        """ SELECT id_pacjenta, imie, nazwisko FROM pacjenci ORDER BY nazwisko; """
    )
    pacjenci = cursor.fetchall()
    cursor.close()
    return render_template("wizyty.html", data=data, lekarze=lekarze, pacjenci=pacjenci)


@app.route("/edytuj_wizyty", methods=("GET", "POST"))
def edytuj_wizyty():
    id = request.args.get("id")
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        data_wizyty = request.form["data_wizyty"]
        godzina_wizyty = request.form["godzina_wizyty"]
        notatka = request.form["notatka"]
        czy_sie_odbyla = request.form["czy_sie_odbyla"]

        if len(error_string) == 0:
            sql = "UPDATE wizyty SET data_wizyty = %s, godzina_wizyty = %s, notatka = %s, czy_sie_odbyla = %s WHERE id_wizyty = %s"
            cursor.execute(
                sql,
                (
                    data_wizyty,
                    godzina_wizyty,
                    notatka,
                    czy_sie_odbyla,
                    id,
                ),
            )
            mysql.connection.commit()

        return redirect("/wizyty")

    cursor.execute(
        """ SELECT id_wizyty, imie, nazwisko, imie_lek, nazwisko_lek, data_wizyty, godzina_wizyty, notatka, czy_sie_odbyla FROM wizyty JOIN pacjenci ON wizyty.id_pacjenta = pacjenci.id_pacjenta JOIN lekarze ON wizyty.id_lekarza = lekarze.id_lekarza WHERE id_wizyty = %s; """,
        (id,),
    )
    data = cursor.fetchall()

    cursor.execute(
        """ SELECT id_lekarza, imie_lek, nazwisko_lek, specjalizacja FROM lekarze ORDER BY nazwisko_lek; """
    )
    lekarze = cursor.fetchall()

    cursor.execute(
        """ SELECT id_pacjenta, imie, nazwisko FROM pacjenci ORDER BY nazwisko; """
    )
    pacjenci = cursor.fetchall()

    cursor.close()
    return render_template(
        "edytuj_wizyty.html",
        error_string=error_string,
        id=data[0][0],
        imie=data[0][1],
        nazwisko=data[0][2],
        imie_lek=data[0][3],
        nazwisko_lek=data[0][4],
        data_wizyty=data[0][5],
        godzina_wizyty=data[0][6],
        notatka=data[0][7],
        czy_sie_odbyla=data[0][8],
        pacjenci=pacjenci,
        lekarze=lekarze,
    )


@app.route("/recepty", methods=("GET", "POST"))
def strona_recepty():
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        if id is not None:
            sql = "DELETE FROM recepty WHERE id_recepty = %s"
            cursor.execute(sql, (id,))
            mysql.connection.commit()
        else:
            id_pacjenta = request.form["id_pacjenta"]
            id_lekarza = request.form["id_lekarza"]
            data_wystawienia = request.form["data_wystawienia"]
            data_waznosci = request.form["data_waznosci"]
            leki = request.form["leki"]

            if len(error_string) == 0:
                sql = "INSERT INTO recepty VALUES (null, %s, %s, %s, %s, %s)"
                cursor.execute(
                    sql,
                    (id_pacjenta, id_lekarza, data_wystawienia, data_waznosci, leki),
                )
                mysql.connection.commit()

            return redirect("/recepty")

    cursor.execute(
        """ SELECT id_recepty, imie_lek, nazwisko_lek, imie, nazwisko, data_wystawienia, data_waznosci, leki FROM recepty JOIN pacjenci ON recepty.id_pacjenta = pacjenci.id_pacjenta JOIN lekarze ON recepty.id_lekarza = lekarze.id_lekarza; """
    )
    data = cursor.fetchall()

    cursor.execute(
        """ SELECT id_lekarza, imie_lek, nazwisko_lek, specjalizacja FROM lekarze ORDER BY nazwisko_lek; """
    )
    lekarze = cursor.fetchall()

    cursor.execute(
        """ SELECT id_pacjenta, imie, nazwisko FROM pacjenci ORDER BY nazwisko; """
    )
    pacjenci = cursor.fetchall()
    cursor.close()
    return render_template(
        "recepty.html", data=data, lekarze=lekarze, pacjenci=pacjenci
    )


@app.route("/edytuj_recepty", methods=("GET", "POST"))
def edytuj_recepty():
    id = request.args.get("id")
    cursor = mysql.connection.cursor()

    error_string = ""

    if request.method == "POST":
        id = request.form.get("id")
        data_wystawienia = request.form["data_wystawienia"]
        data_waznosci = request.form["data_waznosci"]
        leki = request.form["leki"]

        if len(error_string) == 0:
            sql = "UPDATE recepty SET data_wystawienia = %s, data_waznosci = %s, leki = %s WHERE id_recepty = %s"
            cursor.execute(
                sql,
                (
                    data_wystawienia,
                    data_waznosci,
                    leki,
                    id,
                ),
            )
            mysql.connection.commit()

        return redirect("/recepty")

    cursor.execute(
        """ SELECT id_recepty, imie, nazwisko, imie_lek, nazwisko_lek, data_wystawienia, data_waznosci, leki FROM recepty JOIN pacjenci ON recepty.id_pacjenta = pacjenci.id_pacjenta JOIN lekarze ON recepty.id_lekarza = lekarze.id_lekarza WHERE id_recepty = %s; """,
        (id,),
    )
    data = cursor.fetchall()

    cursor.execute(
        """ SELECT id_lekarza, imie_lek, nazwisko_lek, specjalizacja FROM lekarze ORDER BY nazwisko_lek; """
    )
    lekarze = cursor.fetchall()

    cursor.execute(
        """ SELECT id_pacjenta, imie, nazwisko FROM pacjenci ORDER BY nazwisko; """
    )
    pacjenci = cursor.fetchall()

    cursor.close()
    return render_template(
        "edytuj_recepty.html",
        error_string=error_string,
        id=data[0][0],
        imie=data[0][1],
        nazwisko=data[0][2],
        imie_lek=data[0][3],
        nazwisko_lek=data[0][4],
        data_wystawienia=data[0][5],
        data_waznosci=data[0][6],
        leki=data[0][7],
        pacjenci=pacjenci,
        lekarze=lekarze,
    )


if __name__ == "__main__":
    app.run(debug=True)
