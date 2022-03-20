# Adding A New Environment

## Do **Not**

Do **not** in any way modify the `backend.tf` file within the `./terraform/` directory (this defines where on our GCP account this shared remote state is housed). In this instance the components with each environment are tracked via the single remote state directory (you''ll see a bucket name in `backend.tf` as well as a directory path within as `prefix` - that's where the state is tracked).

You should only ever be looking at **a** (not **this**) `backend.tf` file if you're provisioning a single use groupings of GCP components (the 2nd use case as stated in this repos principle readme - how you do this should you need to is covered in the appropriate documentation).


## Do

**TODO**