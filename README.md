git clone git@github.com:jerhinesmith/oj-repro.git

cd oj-repro

bundle install --path vendor

./run.rb

To get to pass, either comment out the `oj_mimic_json` include or change the version of oj to 2.10.2
