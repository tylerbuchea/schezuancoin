// Copyright (c) 2011-2014 The Schezuancoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef SCHEZUANCOIN_QT_SCHEZUANCOINADDRESSVALIDATOR_H
#define SCHEZUANCOIN_QT_SCHEZUANCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class SchezuancoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit SchezuancoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Schezuancoin address widget validator, checks for a valid schezuancoin address.
 */
class SchezuancoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit SchezuancoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // SCHEZUANCOIN_QT_SCHEZUANCOINADDRESSVALIDATOR_H
