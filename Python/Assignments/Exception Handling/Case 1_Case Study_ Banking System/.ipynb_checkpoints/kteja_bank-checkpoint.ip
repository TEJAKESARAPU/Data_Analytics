{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "0bd92e43-c678-4593-859c-eb8679adb647",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "' Case 1: Case Study – Banking System '"
      ]
     },
     "execution_count": 1,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "''' Case 1: Case Study – Banking System '''"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "a2dda2bf-77e2-4afa-b728-c0fe314060bd",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Imagine you are working as a software developer for a bank. \n",
    "# Your task is to create a banking application module with your name as the module name (e.g., priya_bank.py).\n",
    "\n",
    "# The module should handle:\n",
    "# ->Creating a new account\n",
    "# ->Crediting money\n",
    "# ->Debiting money\n",
    "# ->Handling invalid operations using custom exceptions\n",
    "# ->Ensuring that exceptions are properly managed with try-except-else-finally."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 49,
   "id": "fa833b57-dc48-4bc7-8089-8306c2248187",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Account created successfully!\n",
      "Account Number: 500101010, Account holder: Teja, Balance: 15200\n"
     ]
    }
   ],
   "source": [
    "class InsufficientBalanceError(Exception):\n",
    "    pass\n",
    "\n",
    "class BankAccount:\n",
    "    def __init__(self, account_number, account_holder, balance=0.0):\n",
    "        self.account_number = account_number\n",
    "        self.account_holder = account_holder\n",
    "        self.balance = balance\n",
    "\n",
    "    def create_account(self, account_number, account_holder, initial_balance = 0.0):\n",
    "        self.account_number = account_number\n",
    "        self.account_holder = account_holder\n",
    "        self.balance = initial_balance\n",
    "        return f'Account created successfully!\\nAccount Number: {self.account_number}, Account holder: {self.account_holder}, Balance: {self.balance}'\n",
    "\n",
    "    def credit(self, amount):\n",
    "        try:\n",
    "            if amount<=0:\n",
    "                raise ValueError('Deposit amount must be positive.')\n",
    "            self.balance += amount\n",
    "        except ValueError as e:\n",
    "            print('Error:', e)\n",
    "        else:\n",
    "            print(f'Successfully credited {amount}, Current Balance: {self.balance}')\n",
    "        finally:\n",
    "                print(\"Transaction process completed.\")\n",
    "\n",
    "    def debit(self, amount):\n",
    "        try:\n",
    "            if amount<=0:\n",
    "                raise ValueError('Withdraw amount must be positive')\n",
    "            if amount > self.balance:\n",
    "                raise InsufficientBalanceError('Insufficient Balance for withdrawal.')\n",
    "            self.balance -= amount\n",
    "        except (ValueError, InsufficientBalanceError) as e:\n",
    "            print('Error:', e)\n",
    "        else:\n",
    "            print(f'Successfully debited {amount}, Current Balance: {self.balance}')\n",
    "        finally:\n",
    "                print(\"Transaction process completed.\")\n",
    "\n",
    "    def display_balance(self):\n",
    "        return f'Account Number: {self.account_number}, Account holder: {self.account_holder}, Current balance: {self.balance}'\n",
    "\n",
    "ba = BankAccount(0, '', 0.0)\n",
    "print(ba.create_account(500101010, 'Teja', 15200))\n",
    "ba.credit(400)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 56,
   "id": "1939c8f1-d154-40dd-a9ed-506a3d732d86",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Error: Deposit amount must be positive.\n",
      "Transaction failed.\n"
     ]
    }
   ],
   "source": [
    "ba.credit(-500)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 57,
   "id": "7afb8c89-d5ea-4629-9448-3464aa35a050",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Error: Deposit amount must be positive.\n",
      "Transaction failed.\n"
     ]
    }
   ],
   "source": [
    "ba.credit(-500)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 58,
   "id": "69da76a0-fca0-4ec8-a19c-b07a691cac02",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Error: Withdraw amount must be positive\n",
      "Transaction failed.\n"
     ]
    }
   ],
   "source": [
    "ba.debit(-50)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 59,
   "id": "7e7d7bd3-c35f-465a-82bc-1617355d940c",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Sucessfully debited 500, Current Balance: 14600\n",
      "Transaction process completed.\n"
     ]
    }
   ],
   "source": [
    "ba.debit(500)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 60,
   "id": "db12fd3d-4bfc-43da-b961-3378c9f61c96",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Account Number: 500101010, Account holder: Teja, Current balance: 14600\n"
     ]
    }
   ],
   "source": [
    "print(ba.display_balance())"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "b4b98fcc-6fa5-47aa-9bf9-fad3d136e030",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.13.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
