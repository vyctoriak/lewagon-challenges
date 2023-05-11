# TODO: Write a seed

require 'faker'

joana = User.create(
        username: nil,
        email: "joana@gmail.com"
    )

p joana.username