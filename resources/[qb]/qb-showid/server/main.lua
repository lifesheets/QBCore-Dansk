local QBCore = exports['qb-core']:GetCoreObject()

QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

