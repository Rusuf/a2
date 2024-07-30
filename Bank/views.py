from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden
from .forms import BankForm, BranchForm
from .models import Bank, Branch

def home(request):
    return render(request, 'bank/home.html')



def add_bank(request):
    if request.method == 'POST':
        form = BankForm(request.POST)
        if form.is_valid():
            bank = form.save(commit=False)
            bank.owner = request.user
            bank.save()
            return redirect('bank_details', bank_id=bank.id)
    else:
        form = BankForm()
    return render(request, 'bank/add_bank.html', {'form': form})


def add_branch(request):
    if request.method == 'POST':
        form = BranchForm(request.POST)
        if form.is_valid():
            branch = form.save()
            return redirect('branch_details', branch_id=branch.id)
    else:
        form = BranchForm()
    return render(request, 'bank/add_branch.html', {'form': form})

def bank_details(request, bank_id):
    bank = get_object_or_404(Bank, id=bank_id)
    return render(request, 'bank/bank_details.html', {'bank': bank})


def branch_details(request, branch_id):
    branch = get_object_or_404(Branch, id=branch_id)
    return render(request, 'bank/branch_details.html', {'branch': branch})

