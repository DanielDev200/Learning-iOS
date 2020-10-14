const express = require('express');
const mongoose = require('mongoose');
var app = express();
var Data = require('./noteSchema');

mongoose.connect("mongodb://localhost/newDB", {useNewUrlParser: true, useUnifiedTopology: true});

mongoose.connection.once("open", () => {
  console.log('connected to DB');
}).on("error", (error) => {
  console.log('failed to connect', error);
});

mongoose.set('useFindAndModify', false);

// CREATE NOTE
app.post("/create", async (req, res) => {
  console.log("--- in create ---");
  var note = new Data({
    note: req.get("note"),
    title: req.get("title"),
    date: req.get("date")
  });

  // convert to async/await
  note.save().then(() => {
    if (note.isNew === false) {
      console.log('New note saved');
      res.send('New note saved');
      return
    }

    console.log('New note failed to save');
  });
});

// DELETE NOTE
app.post('/delete', async (req, res) => {
  console.log('--- deleting ---');
  await Data.findByIdAndDelete(req.get('id'));

  res.send({message: 'deleted'});
});

// UPDATE NOTE
app.post('/update', (req, res) => {
  console.log('-- here --');
  Data.findByIdAndUpdate({
      _id: req.get('id')
    },
    {
      note: req.get('note'),
      title: req.get('title'),
      date: req.get('date')
    },
    (err, result) => {
      if (err) {
        console.log(`failed to update note with id ${req.get('id')}: `, err);
        res.send({message: `failed to update note with id ${req.get('id')}`});
        return;
      }

      console.log('-- success --');
      res.send({message: `--- note with id ${req.get('id')} updated ---`});
    }
  );
});

// FETCH ALL NOTES
app.get('/fetch', async (req, res) => {
  const notes = await Data.find({});

  if (notes.length === 0) {
    console.log('something is not right');
    res.send([]);
  }

  res.send(notes);
});


// TODO: using home network
var server = app.listen(8081, "192.168.1.99", () => {
  console.log("---- server is running ----");
});