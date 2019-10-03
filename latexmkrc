add_cus_dep('asy', 'pdf', 0, 'run_asy');

sub run_asy {
  if ( $silent ) {
    system "asy -f pdf -q '$_[0]'";
  }
  else {
    system "asy -f pdf '$_[0]'";
  };
}
