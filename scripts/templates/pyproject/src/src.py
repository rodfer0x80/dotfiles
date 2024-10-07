from dataclasses import dataclass

from .logger import logger

@dataclass
class Source:
  src: str

  def __post_init__(self):
    pass
