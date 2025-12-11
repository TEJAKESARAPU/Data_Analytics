#!/usr/bin/env python
# coding: utf-8

# In[1]:


''' Case 1: Case Study – Banking System '''


# In[2]:


# Imagine you are working as a software developer for a bank. 
# Your task is to create a banking application module with your name as the module name (e.g., priya_bank.py).

# The module should handle:
# ->Creating a new account
# ->Crediting money
# ->Debiting money
# ->Handling invalid operations using custom exceptions
# ->Ensuring that exceptions are properly managed with try-except-else-finally.


# In[49]:


class InsufficientBalanceError(Exception):
    pass

class BankAccount:
    def __init__(self, account_number, account_holder, balance=0.0):
        self.account_number = account_number
        self.account_holder = account_holder
        self.balance = balance

    def create_account(self, account_number, account_holder, initial_balance = 0.0):
        self.account_number = account_number
        self.account_holder = account_holder
        self.balance = initial_balance
        return f'Account created successfully!\nAccount Number: {self.account_number}, Account holder: {self.account_holder}, Balance: {self.balance}'

    def credit(self, amount):
        try:
            if amount<=0:
                raise ValueError('Deposit amount must be positive.')
            self.balance += amount
        except ValueError as e:
            print('Error:', e)
        else:
            print(f'Successfully credited {amount}, Current Balance: {self.balance}')
        finally:
                print("Transaction process completed.")

    def debit(self, amount):
        try:
            if amount<=0:
                raise ValueError('Withdraw amount must be positive')
            if amount > self.balance:
                raise InsufficientBalanceError('Insufficient Balance for withdrawal.')
            self.balance -= amount
        except (ValueError, InsufficientBalanceError) as e:
            print('Error:', e)
        else:
            print(f'Successfully debited {amount}, Current Balance: {self.balance}')
        finally:
                print("Transaction process completed.")

    def display_balance(self):
        return f'Account Number: {self.account_number}, Account holder: {self.account_holder}, Current balance: {self.balance}'

ba = BankAccount(0, '', 0.0)
print(ba.create_account(500101010, 'Teja', 15200))
ba.credit(400)


# In[56]:


ba.credit(-500)


# In[57]:


ba.credit(-500)


# In[58]:


ba.debit(-50)


# In[59]:


ba.debit(500)


# In[60]:


print(ba.display_balance())


# In[ ]:




