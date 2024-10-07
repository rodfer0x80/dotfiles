from dataclasses import dataclass

from jsonargparse import CLI

from src.src import Source

@dataclass()
class Main:
  src: str

  def __post_init__(self):
    self.source = Source(self.src)

  def run(self):
    print(self.source, self.src)


def main():
  try:
    CLI(Main)
    return 0
  except KeyboardInterrupt:
    return 0
  except ValueError:
    return 0


if __name__ == '__main__':
  exit(main())
