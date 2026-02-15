from robot.api.deco import keyword


class MathKeywords:
    @keyword("Add Integers")
    def add_integers(self, left: int, right: int) -> int:
        return int(left) + int(right)

    @keyword("Multiply Integers")
    def multiply_integers(self, left: int, right: int) -> int:
        return int(left) * int(right)
