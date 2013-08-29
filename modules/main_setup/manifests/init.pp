class main_setup{
    package {
        [
        'build-essential',
        'vim',
        'curl',
        'git'
      ]:
          ensure  => 'installed',
  }
}
