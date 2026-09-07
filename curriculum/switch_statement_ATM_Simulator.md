# Switch Statement — ATM Simulator

Source: `switch_statement_ATM_Simulator.docx`. Low priority per the exam-week time budget — she's already seen the `switch` pattern elsewhere.

## ATM Simulator (single run)

Simulate one ATM transaction. Initial balance: 1000. Initial PSW: 666666.

```
=== ATM Menu ===
1. Deposit
2. Withdraw
3. Check Balance
4. Exit
Please input your choice:
```

Use a `switch` statement on the user's choice.

**Deposit (case 1):** prompt for amount. If amount > 0, add to balance and show new balance. If amount ≤ 0: "Amount must be positive, operation cancelled."

**Withdraw (case 2):** prompt for amount.
- amount ≤ 0 → "Amount must be positive, operation cancelled."
- amount > balance → "Insufficient balance, withdrawal failed. Current balance: X.XX"
- else → subtract, "Withdrawal successful! Current balance: X.XX"

**Check Balance (case 3):** display current balance.

**Exit (case 4):** "Thank you, goodbye!"

**Invalid choice (default):** "Invalid choice, please enter a number between 1 and 4."
