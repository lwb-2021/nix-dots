{ pkgs, ... }:
pkgs.python3.withPackages (
  ps: with ps; [
    pandas
    matplotlib
    numpy
    requests

    tabulate

    ipython
    ipykernel
  ]
)
