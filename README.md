# MarkIt

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

To start the console:
  * `iex -S mix`

To start the database:
  * `mix ecto.create`
  * `mix ecto.migrate`
  * `mix ecto.reset` ( It's just necessary when you want to reset the database.)

An example of creating a new schema using the generator:
  * `mix phx.gen.json Accounts User users name:string email:string:unique crypted_password:string`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
