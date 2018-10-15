# coherence-setup

We could not make coherence work based on the online instructions. Therefore, we took 
coherence_demo available online and adopted it for our purposes.

Here you will find two folders - coherence_demo_confirm and coherence_demo_no_confirm. 
The first one needs email confirmation after registration and the second one does not.

Also, the PERL file cleanup-coherence.perl renames the demo project with the following
command.

~~~~~~~~~
cleanup-coherence.perl coherence_demo_confirm StripeApp stripe_app
~~~~~~~~~

Also remember to cleanup the deps, \_build  and  assets/node_modules directories and then reinstall everything.

~~~~~~~~
mix do deps.get; deps.compile
mix ecto.setup
cd assets && npm install
mix phx.server
~~~~~~~~

Please note that coherence_demo_confirm runs at port 4000, and coherence_demo_no_confirm runs at
port 80.



