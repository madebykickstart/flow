App.Store = DS.Store.extend({
  revision: 13,
  adapter: 'DS.RESTAdapter'
});

DS.RESTAdapter.reopen({
  url: 'http://localhost:3000'
});
