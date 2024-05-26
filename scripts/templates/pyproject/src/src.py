from dataclasses import dataclass

@dataclass
class Source:
  src: str

  def __post_init__(self):
    pass
