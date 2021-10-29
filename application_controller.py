from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route('/hello')
def hello():
    name = "Hoge"
    #return name
    return render_template('hello.html', title='flask test', name=name)

@app.route("/test", methods=["GET", "POST"])
def test():
    if request.method == 'POST':
        if request.form['send'] == 'aaa':
            m = '12345'
            return render_template('testindex.html', message=m)

        if request.form['send'] == 'bbb':
            m = '67890'
            return render_template('testindex.html', message=m)

        if request.form['send'] == 'ccc':
            m = '1234567890'
            return render_template('testindex.html', message=m)
    else:
        return render_template('testindex.html')


if __name__ == '__main__':
    app.run()

    

