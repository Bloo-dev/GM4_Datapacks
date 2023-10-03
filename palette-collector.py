from __future__ import annotations
import os
import re
from enum import Enum
from typing import List
from dataclasses import dataclass, field

class Icon_Type(str, Enum):
    SVG = '.svg'
    PNG = '.png'

    def __str__(self) -> str:
        return self.value

@dataclass
class Icon():
    module_id: str
    type: Icon_Type = Icon_Type.PNG
    palette: List[int] | None = None

    def as_dict(self):
        out_palette = None
        if self.palette:
            out_palette = [hex(color) for color in self.palette]
        return {"module_id": self.module_id, "type": self.type, "palette": out_palette}
    
    def load_palette_from_file(self):
        if self.type is not Icon_Type.SVG:
            raise ValueError("Only 'svg'-type icons are supported.")

        with open(f"{self.module_id}{os.sep}pack{self.type}") as f:
            self.palette = [int(hex_color, 16) for hex_color in re.findall(pattern='#((?:[A-F]|[0-9]){6})', string=f.read())]
    
    def __repr__(self) -> str:
        return self.as_dict().__repr__()

def enumerate_svgs(directory: str) -> List[Icon]:
    out: List[Icon] = []

    for location in os.walk(directory):
        if location[2].count('pack.svg'):
            icon = Icon(location[0].split(os.sep)[-1], type=Icon_Type.SVG)
            icon.load_palette_from_file()
            out.append(icon)
    return out

@dataclass
class Palette_Color():
    value: int
    occurrences: List[str] = field(default_factory=list)

    def add_occurrence(self, module_id: str):
        self.occurrences.append(module_id)

    def as_dict(self):
        return {"value": hex(self.value), "occurrences": self.occurrences}
    
    def __repr__(self) -> str:
        return self.as_dict().__repr__()


def build_global_palette(directory: str):
    global_palette: List[Palette_Color] = []

    def find_match_in_global_palette(color: int):
        for entry in global_palette:
            if entry.value == color:
                entry.add_occurrence(icon.module_id)
                return True
        return False

    for icon in enumerate_svgs(directory):
        if not icon.palette:
            continue # icon has no palette, skip

        for color in icon.palette:
            if find_match_in_global_palette(color):
                continue
            new_palette_entry = Palette_Color(color)
            new_palette_entry.add_occurrence(icon.module_id)
            global_palette.append(new_palette_entry)
    return global_palette


if __name__ == '__main__':
    global_palette = build_global_palette(os.path.dirname(os.path.realpath(__file__)))
    sorted_global_palette = sorted(global_palette, key=lambda entry: len(entry.occurrences), reverse=True)
    print([hex(entry.value) for entry in sorted_global_palette])
    #print([entry for entry in out if len(entry.occurrences) > 1])
    #print(len(out))
