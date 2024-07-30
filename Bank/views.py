from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden, HttpResponseNotFound
from .models import Bank, Branch
from .forms import BankForm, BranchForm

@login_required
def add_bank(request):
    if request.method == 'POST':
        form = BankForm(request.POST)
        if form.is_valid():
            bank = form.save(commit=False)
            bank.owner = request.user
            bank.save()
            return redirect(f'/banks/{bank.id}/details/')
    else:
        form = BankForm()
    return render(request, 'bank/add_bank.html', {'form': form})

@login_required
def add_branch(request, bank_id):
    bank = get_object_or_404(Bank, id=bank_id)
    if bank.owner != request.user:
        return HttpResponseForbidden()

    if request.method == 'POST':
        form = BranchForm(request.POST)
        if form.is_valid():
            branch = form.save(commit=False)
            branch.bank = bank
            branch.save()
            return redirect(f'/banks/branch/{branch.id}/details/')
    else:
        form = BranchForm(initial={'email': 'default@example.com'})
    return render(request, 'bank/add_branch.html', {'form': form})

def home(request):
    return render(request, 'bank/home.html')
