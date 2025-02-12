"""
my_module.py

This module provides basic mathematical operations.
"""


def add_numbers(a, b):
    """
    Add two numbers.

    Parameters
    ----------
    a : int or float
        The first number.
    b : int or float
        The second number.

    Returns
    -------
    int or float
        The sum of a and b.

    Examples
    --------
    >>> add_numbers(3, 5)
    8
    >>> add_numbers(2.5, 4.5)
    7.0
    """
    return a + b


class Calculator:
    """
    A simple calculator class.

    Methods
    -------
    multiply(x, y)
        Multiplies two numbers.
    """

    def multiply(self, x, y):
        """
        Multiply two numbers.

        Parameters
        ----------
        x : int or float
            The first number.
        y : int or float
            The second number.

        Returns
        -------
        int or float
            The product of x and y.

        Examples
        --------
        >>> calc = Calculator()
        >>> calc.multiply(3, 4)
        12
        """
        return x * y
